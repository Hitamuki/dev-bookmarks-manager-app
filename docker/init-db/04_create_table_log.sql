\connect bookmarks_manager;

-- ログテーブル
CREATE TABLE log.logs (
    id SERIAL PRIMARY KEY,
    log_level VARCHAR(10) NOT NULL,
    operation_type VARCHAR(255) NOT NULL,
    table_name VARCHAR(255) NOT NULL,
    record_id INT NOT NULL,
    operation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT,
    details TEXT
);
COMMENT ON COLUMN log.logs.operation_type IS '操作タイプ（例:INSERT、UPDATE、DELETE）';
COMMENT ON COLUMN log.logs.table_name IS '操作対象のテーブル名';
COMMENT ON COLUMN log.logs.record_id IS '操作対象のレコードID';
COMMENT ON COLUMN log.logs.operation_time IS '操作日時';
COMMENT ON COLUMN log.logs.user_id IS '操作を行ったユーザーID';
COMMENT ON COLUMN log.logs.details IS '操作の詳細';
COMMENT ON TABLE log.logs IS 'ログ';
