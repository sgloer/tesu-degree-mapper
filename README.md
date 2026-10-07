# tesu-degree-mapper

Given exams a student already has, what is still required for one Thomas Edison State University degree.

![tests](https://github.com/sgloer/tesu-degree-mapper/actions/workflows/tests.yml/badge.svg)

Schema and seed are sql/001_schema.sql and sql/002_seed.sql. The gap query is sql/003_gap.sql. The index comparison is docs/explain-gap-query.md.

Start MySQL and run the gap query:

    docker compose up -d
    docker compose exec mysql mysql -uroot -proot degree_mapper < sql/003_gap.sql

PHPUnit checks that an exam maps to a requirement, and that a mapped exam is not still remaining. GitHub Actions runs those tests on every push.
