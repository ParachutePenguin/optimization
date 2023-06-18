FROM gitpod/workspace-full:latest

USER gitpod

# Install juliaup
RUN brew install juliaup

# Install Pluto.jl
RUN julia -e 'using Pkg; Pkg.add("JuMP"); Pkg.add("HiGHS"); Pkg.precompile();'
