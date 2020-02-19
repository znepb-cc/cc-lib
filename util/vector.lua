local uvector = {}

-- Get the squared magnitude of a vector.
function uvector.vecMagSq(vector)
	return vector.x * vector.x + vector.y * vector.y
end

-- Get the distance between two vectors.
function uvector.vecDist(a, b)
    local dx = b.pos.x - a.pos.x
    local dy = b.pos.y - a.pos.y
    return uvector.pythagoras(dx, dy)
end

return uvector
