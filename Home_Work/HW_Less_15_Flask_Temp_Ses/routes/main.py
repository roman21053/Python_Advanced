import hashlib
from app import app, db
from flask import render_template, request, redirect, session
from models.models import User


@app.route('/')
def hello_world():
    return render_template("index.html")


@app.route("/sign-up")
def sign_up():
    return render_template("sign-up.html")


@app.route("/save-user", methods=["POST"])
def register():
    data = request.form
    password_hash = hashlib.sha256(data.get("password").encode("utf-8"))
    user = User(
        first_name=data.get("first_name"),
        last_name=data.get("last_name"),
        email=data.get("email"),
        password=password_hash.hexdigest(),
    )
    db.session.add(user)
    db.session.commit()
    session["user"] = user.serialize
    return redirect("/")
