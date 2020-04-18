# Autogenerated wrapper script for LittleCMS_jll for i686-linux-musl
export liblcms2, transicc, psicc, linkicc

using JpegTurbo_jll
using Libtiff_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `liblcms2`
const liblcms2_splitpath = ["lib", "liblcms2.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
liblcms2_path = ""

# liblcms2-specific global declaration
# This will be filled out by __init__()
liblcms2_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const liblcms2 = "liblcms2.so.2"


# Relative path to `transicc`
const transicc_splitpath = ["bin", "transicc"]

# This will be filled out by __init__() for all products, as it must be done at runtime
transicc_path = ""

# transicc-specific global declaration
function transicc(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(transicc_path)
    end
end


# Relative path to `psicc`
const psicc_splitpath = ["bin", "psicc"]

# This will be filled out by __init__() for all products, as it must be done at runtime
psicc_path = ""

# psicc-specific global declaration
function psicc(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(psicc_path)
    end
end


# Relative path to `linkicc`
const linkicc_splitpath = ["bin", "linkicc"]

# This will be filled out by __init__() for all products, as it must be done at runtime
linkicc_path = ""

# linkicc-specific global declaration
function linkicc(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(linkicc_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"LittleCMS")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (JpegTurbo_jll.PATH_list, Libtiff_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (JpegTurbo_jll.LIBPATH_list, Libtiff_jll.LIBPATH_list,))

    global liblcms2_path = normpath(joinpath(artifact_dir, liblcms2_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global liblcms2_handle = dlopen(liblcms2_path)
    push!(LIBPATH_list, dirname(liblcms2_path))

    global transicc_path = normpath(joinpath(artifact_dir, transicc_splitpath...))

    push!(PATH_list, dirname(transicc_path))
    global psicc_path = normpath(joinpath(artifact_dir, psicc_splitpath...))

    push!(PATH_list, dirname(psicc_path))
    global linkicc_path = normpath(joinpath(artifact_dir, linkicc_splitpath...))

    push!(PATH_list, dirname(linkicc_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

