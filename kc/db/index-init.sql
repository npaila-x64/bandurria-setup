-- Create table for "indexes"
CREATE TABLE indexes (
        index_id TEXT PRIMARY KEY,
        description VARCHAR(255),
        llm_vendor VARCHAR(60)
);

-- Create table for source
CREATE TABLE sources (
        source_id TEXT PRIMARY KEY,
        filename TEXT,
        filetype VARCHAR(60),
        relative_path VARCHAR(255),
    index_id TEXT,
    CONSTRAINT fk_index
        FOREIGN KEY(index_id)
            REFERENCES indexes(index_id)
);

-- Create table for document
CREATE TABLE documents (
        document_id TEXT PRIMARY KEY,
        filename VARCHAR(100),
        content TEXT,
        path VARCHAR(255)
);

-- Insert data into indexes
INSERT INTO indexes(index_id, description, llm_vendor)
VALUES
('komatsu', 'data from komatsu', 'openai'),
('empty_index', 'empty index intended to be used as placeholder', 'openai');
