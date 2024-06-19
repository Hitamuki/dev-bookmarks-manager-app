\connect bookmarks_manager;
CREATE OR REPLACE FUNCTION main.set_timestamps()
RETURNS TRIGGER AS $$
BEGIN
  IF (TG_OP = 'INSERT') THEN
    NEW.created_at = CURRENT_TIMESTAMP;
    NEW.updated_at = CURRENT_TIMESTAMP;
    NEW.created_by = CURRENT_USER;
    NEW.updated_by = CURRENT_USER;
  ELSIF (TG_OP = 'UPDATE') THEN
    NEW.updated_at = CURRENT_TIMESTAMP;
    NEW.updated_by = CURRENT_USER;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- トリガーの設定
CREATE TRIGGER set_timestamps
BEFORE INSERT OR UPDATE ON main.common_columns
FOR EACH ROW EXECUTE FUNCTION main.set_timestamps();
