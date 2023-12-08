from sqlalchemy import Column, Integer, String

from .database import Base

#table trad, le parametre Base vient du script database.py
class Trad(Base):
    __tablename__ = "trads"

    """
    historique des lettres traduite en Morse
    """

    id = Column(Integer, primary_key=True, index=True)
    word = Column(String(40)) # lettre
    dictionnary = Column(String(40)) #
    trad = Column(String(40)) # lettre en question en morse 

#table DicLine
class DicLine(Base):
    __tablename__="dicline"

    """
    Traduction d'une lettre de l'alphabet en Morse :
    a: .-
    b: --
    c: ..

    etc.
    """

    id = Column(Integer, primary_key=True, index=True) 
    Key = Column(String(40))# a
    valeur = Column(String(40))# .-
    dictid = Column(Integer, foreign_key=True) 

#relation OneToMany entre la table : DicLine et Dict 

#table Dictionnaire
class Dict(Base):
    __tablename__="dict"
    """
    encodeur, serait le nom approprié pour cette table! En effet, un dictionnaire correspond
    à une méthode de traduction ex : 

    user1 : "souhaite traduire en Morse"
    -> créer un dictionnaire Morse (un seul!)

    user2 : "souhaite traduire un mot en Binaire"
    -> créer une dictionnaire en Binaire
    """
    dictid = Column(Integer, primary_key=True, index=True)
    name = Column(String(60))
