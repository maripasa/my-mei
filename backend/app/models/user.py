from typing import List, Optional
from sqlmodel import SQLModel, Field, Relationship

class User(SQLModel, table=True):
    __tablename__ = "users"

    id:Optional[int] = Field(default=None, primary_key=True)
    email: str = Field(index=True, unique=True)
    password_hash: str

    roles: List["Role"] = Relationship(
        back_populates="users",
        link_model="UserRole"
    )
