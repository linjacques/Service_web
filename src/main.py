from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session

from .params import TradParams
from .response import IndexResponse, getTradResponse, postTradResponse
from .models import Trad, Base, DicLine, Dict
from .database import SessionLocal, engine


#fonction qui créer les tables (une classe représente une table dans models.py) à partir d'une api
Base.metadata.create_all(bind=engine)

app = FastAPI()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/", response_model=IndexResponse)
def index():
    return {'msg': 'Hello World !'}


#méthode POST, donc envoie quelques choses
#la traduction se fait via cette url
@app.post('/trad', response_model=postTradResponse)
def postTrad(params: TradParams, db: Session = Depends(get_db)):

    trad = ""

    trad_db = Trad(word=params.word, trad=trad, dictionnary=params.dictionnary)
    db.add(trad_db)
    db.commit()

    return {
        'word': params.word,
        'dictionnary': params.dictionnary,
        'trad': trad
    }


#taper dans l'url 5000/trad/ votre mot 
#méthode GET, donc récupère quelques choses!
@app.get("/trad/{word}", response_model=getTradResponse)
def trad(word: str):
    return {
        'word': word
    }

#Nouvelle route GET pour récupérer toutes les traductions dans la base de données
@app.get("/all_trad", response_model=list[getTradResponse])
def get_all_trad(db: Session = Depends(get_db)):
    trads = db.query(Trad).all()
    return [{"word": trad.word, "trad": trad.trad, "dictionnary": trad.dictionnary} for trad in trads]

#Nouvelle route GET pour récupérer les traductions d'un mot spécifique
@app.get("/trad/{word}", response_model=getTradResponse)
def get_single_trad(word: str, db: Session = Depends(get_db)):
    trad = db.query(Trad).filter(Trad.word == word).first()
    if trad:
        return {"word": trad.word, "trad": trad.trad, "dictionnary": trad.dictionnary}
    else:
        return {"message": "Traduction introuvable"}


@app.post("/create_dictionary", response_model=dict)
def create_dictionary(name: str, db: Session = Depends(get_db)):
    # Vérifier si le dictionnaire existe déjà
    existing_dict = db.query(Dict).filter(Dict.name == name).first()
    if existing_dict:
        raise HTTPException(status_code=400, detail="Le dictionnaire existe déjà")

    # ajoute le dictionnaire dans la bdd
    dic_db = Dict(name=name)
    db.add(dic_db)
    db.commit()

    return {"message": f"Dictionnaire '{name}' créé avec succès"}