-- Create table for indices
CREATE TABLE index (
	id TEXT PRIMARY KEY,
	type VARCHAR(255),
	description VARCHAR(8192)
);

-- Create table for sources
CREATE TABLE source (
	id TEXT PRIMARY KEY,
	filename TEXT,
	filetype VARCHAR(60),
	relative_path VARCHAR(255),
    index_id TEXT,
    CONSTRAINT fk_index
        FOREIGN KEY(index_id)
            REFERENCES index(id)
);

-- Create table for documents
CREATE TABLE document (
	document_id TEXT PRIMARY KEY,
	filename VARCHAR(100),
	content TEXT,
	path VARCHAR(255)
    -- source_id TEXT,
    -- CONSTRAINT fk_source
    --     FOREIGN KEY(source_id)
    --         REFERENCES sources(source_id)
);

-- Create table for llms
CREATE TABLE llm (
	id TEXT PRIMARY KEY,
	model VARCHAR(255),
	temperature NUMERIC(2,1),
	max_tokens INTEGER,
	context_window INTEGER,
	num_output INTEGER,
	chunk_overlap_ratio NUMERIC(2,1),
	chunk_size INTEGER
);

INSERT INTO llm(
	id,
	model,
	temperature,
	max_tokens,
	context_window,
	num_output,
	chunk_overlap_ratio,
	chunk_size
) VALUES (
	'6299fd74-7157-4557-87fa-0a8425923ec5',
	'gpt-3.5-turbo-16k',
	0,
	512,
	4097,
	256,
	0.1,
	512
);
