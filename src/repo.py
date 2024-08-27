from sqlalchemy.orm import Session
from src.models import Trad
from .params import TradParams

def create_trad(db: Session, trad: TradParams):
    tradOBJ = Trad(
        word=trad.word,
        trad=trad.trad,
        dictionnary=trad.dictionnary
    )
    db.add(tradOBJ)
    db.commit()
