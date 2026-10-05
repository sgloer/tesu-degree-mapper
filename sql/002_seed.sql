INSERT INTO programs (id, code, name) VALUES
  (1, 'BA-LIB', 'BA in Liberal Studies');

INSERT INTO requirements (id, program_id, code, name, credits) VALUES
  (1, 1, 'ENC-101', 'English Composition I', 3),
  (2, 1, 'ENC-102', 'English Composition II', 3),
  (3, 1, 'MAT-105', 'Applied Liberal Arts Mathematics', 3),
  (4, 1, 'SOC-101', 'Introduction to Sociology', 3),
  (5, 1, 'PSY-101', 'Introduction to Psychology', 3),
  (6, 1, 'GOV-101', 'American Government', 3),
  (7, 1, 'BIO-101', 'Introduction to Biology', 3),
  (8, 1, 'HIS-101', 'Western Civilization', 3);

INSERT INTO exam_maps (exam_code, exam_type, program_id, requirement_id) VALUES
  ('CLEP-COLLEGE-COMP', 'CLEP', 1, 1),
  ('CLEP-COLLEGE-COMP-MODULAR', 'CLEP', 1, 2),
  ('CLEP-COLLEGE-MATH', 'CLEP', 1, 3),
  ('CLEP-INTRO-SOC', 'CLEP', 1, 4),
  ('TECEP-SOC-210', 'TECEP', 1, 4),
  ('DSST-GEN-ANTHRO', 'DSST', 1, 5);
