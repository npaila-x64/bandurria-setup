
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

-- Create table for query engines
CREATE TABLE query_engine (
	tool_name VARCHAR(255) PRIMARY KEY,
	tool_description VARCHAR(255),
	index_type VARCHAR(255),
	system_prompt VARCHAR(255),
	similarity_top_k INTEGER,
	llm_id TEXT,
	CONSTRAINT fk_llm
        FOREIGN KEY(llm_id)
            REFERENCES llm(id)
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
	1024,
	16300,
	256,
	0.1,
	512
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
	'7299fd74-7157-45a7-871a-0a2425923ec5',
	'gpt-4',
	0,
	1024,
	16300,
	256,
	0.1,
	512
);

-- Insert data into query engines
INSERT INTO query_engine(
	tool_name,
	tool_description,
	index_type,
	system_prompt,
	similarity_top_k,
	llm_id
) VALUES (
	'storage_aceite_desechado',
	'Provee información relacionada al HDS sobre aceites desechados. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
);
