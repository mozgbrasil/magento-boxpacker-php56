-- add table prefix if you have one
DROP TABLE IF EXISTS mozg_boxpacker_packing_comment_store;
DROP TABLE IF EXISTS mozg_boxpacker_packing_comment;
DROP TABLE IF EXISTS mozg_boxpacker_packing_store;
DROP TABLE IF EXISTS mozg_boxpacker_packing;
DELETE FROM core_resource WHERE code = 'mozg_boxpacker_setup';
DELETE FROM core_config_data WHERE path like 'mozg_boxpacker/%';