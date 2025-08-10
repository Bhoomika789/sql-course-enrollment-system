# SQL Course Enrollment System (MySQL)

This repository contains a complete MySQL-based sample project to demonstrate hands-on SQL skills:
- schema creation, constraints, and indexes
- sample realistic data insertion
- complex queries (joins, aggregates, window functions)
- stored procedures, triggers, and views

## Files
- `schema.sql` - Creates the database and tables.
- `insert_data.sql` - Inserts sample data.
- `queries.sql` - Useful queries to analyze data.
- `stored_procedures.sql` - Stored procedures (e.g., `sp_enroll_student`).
- `triggers.sql` - Example trigger to auto-create payment records on enrollment.
- `views.sql` - Views for active enrollments and course revenue.

## Setup (MySQL)
1. Install MySQL 8.x and connect using a client (mysql CLI, MySQL Workbench, or similar).
2. Run the scripts in order:
   - `schema.sql`
   - `insert_data.sql`
   - `views.sql`
   - `stored_procedures.sql`
   - `triggers.sql`
   - `queries.sql` (to test)

Example using mysql CLI:
```bash
mysql -u root -p < schema.sql
mysql -u root -p < insert_data.sql
mysql -u root -p < views.sql
mysql -u root -p < stored_procedures.sql
mysql -u root -p < triggers.sql
```

## How to use
- Use the `sp_enroll_student` stored procedure to enroll a user:
```sql
CALL sp_enroll_student(1, 1, @msg);
SELECT @msg;
```

- Explore `queries.sql` to extract insights.

## Next steps / Extensions
- Add user authentication, roles, and an admin panel (frontend).
- Add unit tests for stored procedures.
- Export ER diagram and include in the repo (`/screenshots`).

## License
MIT
