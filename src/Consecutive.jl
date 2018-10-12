module Consecutive

export consecutive

struct ConsecIter{I}
    iter::I
end
consecutive(i) = ConsecIter(i)

function Base.iterate(L::ConsecIter)
    # Get the first item from the iterator
    it = iterate(L.iter)
    it === nothing && (return nothing)
    (first, state) = it

    # Get the second item.
    it = iterate(L.iter, state)
    it === nothing && (return nothing)
    (second, state) = it

    return ((first, second), (second, state))
end

function Base.iterate(L::ConsecIter, s::Tuple)
    # Unpack state
    (first, state) = s
    it = iterate(L.iter, state)
    it === nothing && (return nothing)
    second, state = it

    return ((first, second), (second, state))
end

# Forwards
Base.length(L::ConsecIter) = length(L.iter) - 1
Base.eltype(L::ConsecIter) = eltype(L.iter)
Base.size(L::ConsecIter) = size(L.iter) .- 1
Base.size(L::ConsecIter, dim) = size(L.iter, dim) .- 1
Base.IteratorSize(::ConsecIter{I}) where {I} = Base.IteratorSize(I)
Base.IteratorEltype(::ConsecIter{I}) where {I} = Base.IteratorEltype(I)

end # module
