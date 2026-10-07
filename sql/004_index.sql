ALTER TABLE exam_maps
  ADD INDEX idx_exam_program (exam_code, program_id);
