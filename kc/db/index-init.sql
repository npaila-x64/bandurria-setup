-- Create table for "indexes"
CREATE TABLE indexes (
        id TEXT PRIMARY KEY,
        type VARCHAR(255),
        description VARCHAR(255)
);

-- Create table for source
CREATE TABLE source (
        id TEXT PRIMARY KEY,
        filename TEXT,
        filetype VARCHAR(60),
        relative_path VARCHAR(255),
    index_id TEXT,
    CONSTRAINT fk_index
        FOREIGN KEY(index_id)
            REFERENCES indexes(id)
);

-- Create table for document
CREATE TABLE documents (
        document_id TEXT PRIMARY KEY,
        filename VARCHAR(100),
        content TEXT,
        path VARCHAR(255)
);

-- Insert data into indexes
INSERT INTO indexes(id, type, description)
VALUES
('kc', 'vector', 'data from komatsu');
