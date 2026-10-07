<?php
declare(strict_types=1);

namespace DegreeMapper;

use PDO;

final class GapReport
{
    public function __construct(private PDO $pdo)
    {
    }

    public function requirementForExam(string $examCode, int $programId): ?string
    {
        $stmt = $this->pdo->prepare(
            "SELECT r.code
             FROM exam_maps m
             JOIN requirements r ON r.id = m.requirement_id
             WHERE m.exam_code = :exam_code AND m.program_id = :program_id"
        );
        $stmt->execute(["exam_code" => $examCode, "program_id" => $programId]);
        $code = $stmt->fetchColumn();
        return $code === false ? null : (string) $code;
    }

    public function remaining(int $programId, array $examCodes): array
    {
        $placeholders = implode(",", array_fill(0, count($examCodes), "?"));
        $sql = "SELECT r.code
                FROM requirements r
                LEFT JOIN exam_maps m
                  ON m.requirement_id = r.id
                 AND m.program_id = r.program_id
                 AND m.exam_code IN ($placeholders)
                WHERE r.program_id = ?
                  AND m.exam_code IS NULL
                ORDER BY r.id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([...$examCodes, $programId]);
        return $stmt->fetchAll(PDO::FETCH_COLUMN);
    }
}
