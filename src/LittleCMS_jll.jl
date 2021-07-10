# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule LittleCMS_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("LittleCMS")
JLLWrappers.@generate_main_file("LittleCMS", UUID("d3a379c0-f9a3-5b72-a4c0-6bf4d2e8af0f"))
end  # module LittleCMS_jll
