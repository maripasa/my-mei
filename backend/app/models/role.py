from typing import List, Optional
from sqlmodel import SQLModel, Field, Relationship

class Role(SQLModel, table=True):
    __tablename__ = "roles"

    id: Optional[int] = Field(default=None, primary_key=True)
    name: str = Field(unique=True)

    users: List["User"] = Relationship(
        back_populates="roles",
        link_model="UserRole",
    )
