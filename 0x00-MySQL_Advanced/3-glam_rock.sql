-- Lists all bands with glam rock and rank by longevity
SELECT band_name, (IFNULL(split, 2022) - formed) AS lifespan 
FROM metal_bands
WHERE style Like '%Glam rock%'
ORDER BY lifespan DESC
