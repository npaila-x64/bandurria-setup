
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
	index_id VARCHAR(255),
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

-- Insert data into query engines
INSERT INTO query_engine(
	tool_name,
	tool_description,
	index_type,
	system_prompt,
	similarity_top_k,
	llm_id
) VALUES (
	'storage_agente_extintor',
	'Provee información relacionada al HDS sobre el agente extintor de incendios FORAY. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_agente_extintor_pqh',
	'Provee información relacionada al HDS sobre el agente químico húmedo LVS. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_aire_comprimido',
	'Provee información relacionada al HDS sobre el aire comprimido BLOWING PLUS. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_alcohol_gel',
	'Provee información relacionada al HDS sobre el alcohol gel W-117. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_clorox_tradicional',
	'Provee información relacionada al HDS sobre clorox tradicional. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_cross_check',
	'Provee información relacionada al HDS sobre Dykem Cross-Check. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_limpiador_contacto',
	'Provee información relacionada al HDS sobre el limpiador contacto eléctrico. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_lubricante_superlub',
	'Provee información relacionada al HDS sobre lubricante superlub. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_lubriplate',
	'Provee información relacionada al HDS sobre lubriplate. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_mobilgrease_321',
	'Provee información relacionada al HDS sobre MOBILGREASE XHP 321 MINE. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_mobilshc_680',
	'Provee información relacionada al HDS sobre MOBILGREASE XHP 681 MINE. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_mobilxep_2',
	'Provee información relacionada al HDS sobre MOBILUX EP 2. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_movil_devalc',
	'Provee información relacionada al HDS sobre MOBIL DELVAC MODERN 15W-40 FULL PROTECTION MINE. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_movilfluid_424',
	'Provee información relacionada al HDS sobre MOBILFLUID 424. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_petroleo_copec',
	'Provee información relacionada al HDS sobre Petróleo Diesel A-1. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_toallitas_cloradas',
	'Provee información relacionada al HDS sobre toallas desinfectantes easy clean. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
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
	'storage_vaselina_blanca',
	'Provee información relacionada al HDS sobre la vaselina blanca sólida. Use a detailed plain text question as input to the tool.',
	'vector',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
);
