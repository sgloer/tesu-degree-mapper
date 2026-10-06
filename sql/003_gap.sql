SELECT r.code, r.name
FROM requirements r
LEFT JOIN exam_maps m
ON m.requirement_id = r.id
AND m.program_id = r.program_id
AND m.exam_code IN ('CLEP-COLLEGE-COMP', 'TECEP-SOC-210')
WHERE r.program_id = 1 AND m.exam_code IS NULL;
