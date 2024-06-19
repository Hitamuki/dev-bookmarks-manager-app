\connect bookmarks_manager;
-- 共通カラムテーブル
CREATE TABLE main.common_columns (
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by VARCHAR(255)
);
COMMENT ON COLUMN main.common_columns.created_at IS '登録日時';
COMMENT ON COLUMN main.common_columns.created_by IS '登録ユーザー';
COMMENT ON COLUMN main.common_columns.updated_at IS '更新日時';
COMMENT ON COLUMN main.common_columns.updated_by IS '更新ユーザー';
-- ユーザーテーブル
CREATE TABLE main.users (
	id UUID NOT NULL DEFAULT gen_random_uuid(),
	username varchar(50),
	email varchar(255) UNIQUE,
	password VARCHAR(255),
	CONSTRAINT users_pkey PRIMARY KEY (id)
) INHERITS (main.common_columns);
COMMENT ON COLUMN main.users.username IS 'ユーザー名';
COMMENT ON COLUMN main.users.email IS 'メールアドレス';
COMMENT ON COLUMN main.users.password IS 'パスワード';
COMMENT ON TABLE main.users IS 'ユーザー';
-- ブックマークテーブル
CREATE TABLE main.bookmarks (
	id UUID NOT NULL DEFAULT gen_random_uuid(),
	user_id UUID NOT NULL,
	title varchar(100) NOT NULL,
	description TEXT,
	category_id UUID,
	bookmark_type_id INT,
	url TEXT,
	type int4 NOT NULL,
	level int4 NOT NULL,
	sort int4 NOT NULL,
	FOREIGN KEY (user_id) REFERENCES main.users(id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES main.categories(id) ON DELETE SET NULL,
	FOREIGN KEY (bookmark_type_id) REFERENCES main.m_bookmark_types(id) ON DELETE SET NULL,
	CONSTRAINT bookmarks_pkey PRIMARY KEY (id),
	CONSTRAINT bookmarks_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id)
) INHERITS (main.common_columns);
COMMENT ON COLUMN main.bookmarks.user_id IS 'ユーザーID';
COMMENT ON COLUMN main.bookmarks.title IS 'ブックマークのタイトル';
COMMENT ON COLUMN main.bookmarks.description IS 'ブックマークの説明';
COMMENT ON COLUMN main.bookmarks.category_id IS 'カテゴリID';
COMMENT ON COLUMN main.bookmarks.bookmark_type_id IS 'ブックマークタイプID';
COMMENT ON COLUMN main.bookmarks.url IS 'URL';
COMMENT ON COLUMN main.bookmarks.type IS '0:フォルダ、1:ファイル';
COMMENT ON COLUMN main.bookmarks.level IS '階層レベル';
COMMENT ON COLUMN main.bookmarks.sort IS '並び替え';
COMMENT ON TABLE main.bookmarks IS 'ブックマーク';
-- カテゴリテーブル
CREATE TABLE main.categories (
	id UUID PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	user_id UUID NOT NULL,
	category_type_id INT,
	FOREIGN KEY (user_id) REFERENCES main.users(id) ON DELETE CASCADE,
	FOREIGN KEY (category_type_id) REFERENCES main.m_category_types(id) ON DELETE SET NULL
) INHERITS (main.common_columns);
COMMENT ON COLUMN main.categories.name IS 'カテゴリ名';
COMMENT ON COLUMN main.categories.user_id IS 'ユーザーID';
COMMENT ON COLUMN main.categories.category_type_id IS 'カテゴリタイプID';
COMMENT ON TABLE main.categories IS 'ブックマークのカテゴリ';
-- タグテーブル
CREATE TABLE main.tags (
	id UUID PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	user_id UUID NOT NULL,
	FOREIGN KEY (user_id) REFERENCES main.users(id) ON DELETE CASCADE
) INHERITS (main.common_columns);
COMMENT ON COLUMN main.tags.name IS 'タグ名';
COMMENT ON COLUMN main.tags.user_id IS 'ユーザーID';
COMMENT ON TABLE main.tags IS 'ブックマークに付与するタグ';
-- ブックマークとタグのリレーションテーブル
CREATE TABLE main.bookmark_tags (
	bookmark_id UUID NOT NULL,
	tag_id UUID NOT NULL,
	PRIMARY KEY (bookmark_id, tag_id),
	FOREIGN KEY (bookmark_id) REFERENCES main.bookmarks(id) ON DELETE CASCADE,
	FOREIGN KEY (tag_id) REFERENCES main.tags(id) ON DELETE CASCADE
);
COMMENT ON COLUMN main.bookmark_tags.bookmark_id IS 'ブックマークID';
COMMENT ON COLUMN main.bookmark_tags.tag_id IS 'タグID';
COMMENT ON TABLE main.bookmark_tags IS 'ブックマークとタグの関係';
-- ブックマークタイプのマスターテーブル
CREATE TABLE main.m_bookmark_types (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	description TEXT
);
COMMENT ON COLUMN main.m_bookmark_types.name IS '名前（例：記事、動画、画像など）';
COMMENT ON COLUMN main.m_bookmark_types.description IS 'タイプの説明';
COMMENT ON TABLE main.m_bookmark_types IS 'ブックマーク種別';
-- カテゴリタイプのマスターテーブル
CREATE TABLE main.m_category_types (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	description TEXT
);
COMMENT ON COLUMN main.m_category_types.name IS '名前（例：個人用、仕事用、娯楽など）';
COMMENT ON COLUMN main.m_category_types.description IS '説明';
COMMENT ON TABLE main.m_category_types IS 'カテゴリ種別';
