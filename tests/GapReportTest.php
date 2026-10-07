<?php
declare(strict_types=1);

use DegreeMapper\GapReport;
use PHPUnit\Framework\TestCase;

final class GapReportTest extends TestCase
{
    private PDO $pdo;

    protected function setUp(): void
    {
        $host = getenv("DB_HOST") ?: "127.0.0.1";
        $this->pdo = new PDO(
            "mysql:host=$host;dbname=degree_mapper;charset=utf8mb4",
            "root",
            "root",
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
        );
    }

    public function testExamMapsToRequirement(): void
    {
        $gap = new GapReport($this->pdo);
        $this->assertSame("ENC-101", $gap->requirementForExam("CLEP-COLLEGE-COMP", 1));
    }

    public function testMappedExamIsNotRemaining(): void
    {
        $gap = new GapReport($this->pdo);
        $remaining = $gap->remaining(1, ["CLEP-COLLEGE-COMP"]);
        $this->assertNotContains("ENC-101", $remaining);
        $this->assertContains("SOC-101", $remaining);
    }
}
