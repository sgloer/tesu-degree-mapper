CREATE TABLE programs (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  code VARCHAR(32) NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_programs_code (code)
);

CREATE TABLE requirements (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  program_id INT UNSIGNED NOT NULL,
  code VARCHAR(32) NOT NULL,
  name VARCHAR(255) NOT NULL,
  credits TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_requirements_program_code (program_id, code),
  CONSTRAINT fk_requirements_program
    FOREIGN KEY (program_id) REFERENCES programs (id)
);

CREATE TABLE exam_maps (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  exam_code VARCHAR(64) NOT NULL,
  exam_type ENUM('CLEP', 'DSST', 'TECEP') NOT NULL,
  program_id INT UNSIGNED NOT NULL,
  requirement_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  KEY idx_exam_maps_requirement (requirement_id),
  CONSTRAINT fk_exam_maps_program
    FOREIGN KEY (program_id) REFERENCES programs (id),
  CONSTRAINT fk_exam_maps_requirement
    FOREIGN KEY (requirement_id) REFERENCES requirements (id)
);
