\echo 'Delete and recreate draft_prince db?'
\prompt 'Return for yes or control-C to cancel > ' foo

DROP DATABASE draft_prince_test;
CREATE DATABASE draft_prince_test;

\connect draft_prince_test

\i schema.sql
\i seed.sql