-- roles table
CREATE TABLE IF NOT EXISTS roles (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE
);

-- users table
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- user_roles
CREATE TABLE IF NOT EXISTS user_roles (
  user_id INTEGER NOT NULL,
  role_id INTEGER NOT NULL,
  PRIMARY KEY (user_id, role_id),

  CONSTRAINT fk_user
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE,

  CONSTRAINT fk_role
    FOREIGN KEY (role_id)
    REFERENCES roles(id)
    ON DELETE CASCADE
);

-- seed roles
INSERT INTO roles (name) VALUES ('admin')
ON CONFLICT (name) DO NOTHING;

INSERT INTO roles (name) VALUES ('user')
ON CONFLICT (name) DO NOTHING;
