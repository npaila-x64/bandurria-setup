
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

-- Create table for indices
CREATE TABLE index (
	id VARCHAR(255) PRIMARY KEY,
	type VARCHAR(255),
	description VARCHAR(4096)
);

-- Create table for query engine tools
CREATE TABLE query_engine_tool (
	id TEXT PRIMARY KEY,
	name VARCHAR(255),
	description VARCHAR(4096),
	system_prompt VARCHAR(8192),
	similarity_top_k INTEGER,
	index_id VARCHAR(255),
	llm_id TEXT,
	CONSTRAINT fk_query_engine_tool_index
        FOREIGN KEY(index_id)
            REFERENCES index(id),
	CONSTRAINT fk_query_engine_tool_llm
        FOREIGN KEY(llm_id)
            REFERENCES llm(id)
);

-- Create table for tool templates
CREATE TABLE tool_template (
	id TEXT PRIMARY KEY,
	description VARCHAR(4096),
	system_prompt VARCHAR(8192),
	similarity_top_k INTEGER,
	llm_id TEXT,
	CONSTRAINT fk_tool_template_llm
        FOREIGN KEY(llm_id)
            REFERENCES llm(id)
);

-- Create table for the agent
CREATE TABLE agent (
	id TEXT PRIMARY KEY,
	system_prompt VARCHAR(8192),
	opening_message VARCHAR(4096),
	llm_id TEXT,
	CONSTRAINT fk_agent_llm
        FOREIGN KEY(llm_id)
            REFERENCES llm(id)
);

-- Insert data into llms
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

INSERT INTO agent(
	id,
	system_prompt,
	opening_message,
	llm_id
) VALUES (
	'default',
	'Tu objetivo es asistir y brindar información certera, confiable y basada en los documentos asociados a las HDS (Hojas de Seguridad) utilizados en distintos procesos internos por la empresa Komatsu Cummins.\nEsta información asociada a las HDS (Hojas de Seguridad), será utilizado por técnicos especialistas en los distintos procedimientos de mantención, por lo cual la información brindada debe ser certera y confiable ese carácter se lo dará tu capacidad en basarte en los documentos de las distintas HDS (Hojas de Seguridad) brindaras.\nAlgunas definiciones clave para la empresa y que debes tener claras son las siguientes:\n**Código SGA de Peligro:** Es un Sistema Globalmente Armonizado de clasificacion y etiquetado de productos químicos.\n**Hojas de datos de seguridad(HDS)**:  Son documentos técnicos que proporcionan información detallada sobre los productos químicos. Estas hojas contienen datos importantes sobre los riesgos, la seguridad, el manejo y almacenamiento y la disposición adecuada de sustancias químicas peligrosas.\nTu objetivo es desplegar información sobre las HDS a personal técnico de la Empresa Komatsu. Proporcionando respuestas claras y basadas en el cuerpo de conocimiento proporcionado sobre las HDS. En caso de no contar con la información necesaria, se lo debes indicar al usuario.\nComo asistente virtual de apoyo a Komatsu. TU función principal es proporcionar respuestas claras y precisas a preguntas relacionadas con las Hojas De Seguridad (HDS) que se te otorgan como contexto. Tú objetivo es ser un recurso confiable para el personal técnico de la empresa, manteniendo altos niveles de certeza y una comunicación asertiva.\nProcura mostrar los datos tabulados en formato Markdown.\nTodas tus respuestas deben estar en el formato Markdown.',
	'!Hola! ¿En que puedo ayudarte hoy?',
	'7299fd74-7157-45a7-871a-0a2425923ec5'
);

INSERT INTO tool_template(
	id,
	description,
	system_prompt,
	similarity_top_k,
	llm_id
) VALUES (
	'2812733e-d626-482c-abcd-22134a5dd835',
	'Use a detailed plain text question as input to the tool.',
	'Procura siempre mostrar los enlaces https://i.imgur.com/ que tengas acceso.',
	4,
	'6299fd74-7157-4557-87fa-0a8425923ec5'
);
