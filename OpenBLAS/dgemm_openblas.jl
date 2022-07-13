using LinearAlgebra
using ThreadPinning

function ompenv2pinning()
    if haskey(ENV, "OMP_PROC_BIND")
        bind = lowercase(ENV["OMP_PROC_BIND"])
        if bind == "spread"
            return :spread
        elseif bind == "close"
            return :compact
        end
    end
    return :compact
end

const VERBOSE = false
const PINNING = ompenv2pinning()
const DTYPE = Float64

function init_parallel_linear!(A, B)
    Threads.@threads :static for i in eachindex(A, B)
        A[i] = rand(DTYPE)
        B[i] = rand(DTYPE)
    end
    return nothing
end

function init_parallel_rows!(A, B)
    Threads.@threads :static for i in axes(A, 1)
        for j in axes(A, 2)
            A[i, j] = rand(DTYPE)
            B[i, j] = rand(DTYPE)
        end
    end
    return nothing
end

function bench_dgemm!(C, A, B)
    @assert size(A) == size(B) == size(C)
    @assert size(A, 1) == size(A, 2)
    N = size(A, 1)
    mul!(C, A, B) # warmup
    Δt_min = Inf
    for i in 1:3
        Δt = @elapsed mul!(C, A, B)
        perf = 2.0 * N^3 / Δt * 1e-9
        println("N=$N, Δt=$Δt, perf=$perf")
        flush(stdout)
        Δt_min = min(Δt_min, Δt)
    end
    best_perf = 2.0 * N^3 / Δt_min * 1e-9
    println("\tBest performance: ", best_perf, " GFLOPS")
    return nothing
end

function main()
    N = parse(Int, get(ARGS, 1, "16384")) # 8192
    pinthreads(PINNING)

    if VERBOSE
        println("Environment variables:")
        omp_envs = filter(x -> startswith(first(x), "OMP_") || startswith(first(x), "OPENBLAS_"), ENV)
        display(omp_envs)
        @show N
        @show DTYPE
        @show Threads.nthreads()
        @show BLAS.get_num_threads()
        threadinfo(; blas=true, color=false)
        flush(stdout)
    end

    println("\nNo initialization of A,B, or C.")
    A = Matrix{DTYPE}(undef, N, N)
    B = Matrix{DTYPE}(undef, N, N)
    C = Matrix{DTYPE}(undef, N, N)
    bench_dgemm!(C, A, B)

    println("\nLinear parallel initialization")
    A = Matrix{DTYPE}(undef, N, N)
    B = Matrix{DTYPE}(undef, N, N)
    C = Matrix{DTYPE}(undef, N, N)
    init_parallel_linear!(A, B)
    bench_dgemm!(C, A, B)

    println("\nRow-wise parallel initialization")
    A = Matrix{DTYPE}(undef, N, N)
    B = Matrix{DTYPE}(undef, N, N)
    C = Matrix{DTYPE}(undef, N, N)
    init_parallel_rows!(A, B)
    bench_dgemm!(C, A, B)

    println("\nNaive initialization of A and B. No initialization of C.")
    A = rand(DTYPE, N, N)
    B = rand(DTYPE, N, N)
    C = Matrix{DTYPE}(undef, N, N) # IMPORTANT: do not fill C to avoid "first-touch issue".
    bench_dgemm!(C, A, B)

    println("\nNaive initialization (i.e. serial)")
    A = rand(DTYPE, N, N)
    B = rand(DTYPE, N, N)
    C = zeros(DTYPE, N, N) # WARNING: will have bad performance!
    bench_dgemm!(C, A, B)
end

main()
