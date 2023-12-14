from pydantic import BaseModel


class encodage(BaseModel):
    key: str
    valeur: str

    class Config:
        orm_mode = True

class TradParams(BaseModel):
    word: str
    dictionnary: str

class create_dic(BaseModel):
    dictionnary: str
    table: list[encodage]

    class Config:
        orm_mode = True

class delete_dic(BaseModel):
    dictionnary: str

    class Config:
            orm_mode = True
    
