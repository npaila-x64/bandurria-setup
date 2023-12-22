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
    -- source_id TEXT,
    -- CONSTRAINT fk_source
    --     FOREIGN KEY(source_id)
    --         REFERENCES sources(source_id)
);

-- Insert data into indexes
INSERT INTO indexes(index_id, description, llm_vendor)
VALUES
('investigacion', 'data from investigacion.ufro.cl', 'openai'),
('ufro', 'data from ufro.cl', 'openai'),
('aguas', 'data from aguas araucania', 'openai'),
('empty_index', 'empty index intended to be used as placeholder', 'openai');

INSERT INTO sources(source_id, filename, filetype, relative_path, index_id)
VALUES
('8459d825-4bc2-4fed-af73-1cab80d3dd04', 'apoyos.txt', 'text/plain', '/', 'investigacion'),
('6299fd74-7157-4557-87fa-0a8425923ec5', 'concursos.txt', 'text/plain', '/', 'investigacion'),
('f53eb4b9-e1f2-4c63-83ed-2e44ce8d37f4', 'equipo.txt', 'text/plain', '/', 'investigacion'),
('7265a9e8-ff7c-445d-934c-71e3f49a6fe0', 'oferta_de_proyectos.txt', 'text/plain', '/', 'investigacion'),
('5a58d2bd-38fb-4efb-9c3a-1674c693c231', 'postulacion.txt', 'text/plain', '/', 'investigacion');
