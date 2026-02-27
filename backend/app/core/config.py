from pydantic import BaseSettings

class Settings(BaseSettings):
    database_host: str
    database_port: int
    database_name: str
    database_user: str
    database_password: str

    @property
    def database_url(self) -> str:
        return (
                f"postgresql+psycopg://{self.database_user}:"
                f"{self.database_password}@"
                f"{self.database_host}:{self.database_port}/"
                f"{self.database_name}"
                )

    class Config:
        env_file = ".env"

settings = Settings()
