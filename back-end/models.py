"""SQLAlchemy models for Draft Prince"""

from flask_bcrypt import Bcrypt
from flask_sqlalchemy import SQLAlchemy

bcrypt = Bcrypt()
db = SQLAlchemy()


class User(db.Model):
    """User in the system"""

    __tablename__ = 'users'

    id = db.Column(
        db.Integer,
        primary_key=True,
    )

    username = db.Column(
        db.String(250),
        nullable=False,
        unique=True,
    )

    password = db.Column(
        db.String(100),
        nullable=False,
    )

    admin = db.Column(
        db.Boolean,
        nullable=False,
        default=False
    )

    players = db.relationship('Player', backref='user')

    @classmethod
    def signup(cls, username, password):
        """Sign up user.

        Hashes password and adds user to session.
        """

        hashed_pwd = bcrypt.generate_password_hash(password).decode('UTF-8')

        user = User(
            username=username,
            email=email,
            password=hashed_pwd,
            admin=False,
        )

        db.session.add(user)
        return user

    @classmethod
    def authenticate(cls, username, password):
        """Find user with `username` and `password`.

        This is a class method (call it on the class, not an individual user.)
        It searches for a user whose password hash matches this password
        and, if it finds such a user, returns that user object.

        If this can't find matching user (or if password is wrong), returns
        False.
        """

        user = cls.query.filter_by(username=username).one_or_none()

        if user:
            is_auth = bcrypt.check_password_hash(user.password, password)
            if is_auth:
                return user

        return False


class Player(db.Model):
    """NBA Player and his stats."""

    __tablename__ = 'players'

    Round = db.Column(
        db.Integer,
        nullable=False,
    )

    Rank = db.Column(
        db.Integer,
        nullable=False,
        primary_key=True
    )

    Value = db.Column(
        db.Float,
        nullable=False,
    )

    Name = db.Column(
        db.String(100),
        nullable=False,
    )

    Team = db.Column(
        db.String(4),
        nullable=False,
    )

    Pos = db.Column(
        db.String(15),
        nullable=False,
    )

    Inj = db.Column(
        db.String(100),
    )

    Games = db.Column(
        db.Integer,
    )

    m_g = db.Column(
        db.Float
    )

    p_g = db.Column(
        db.Float
    )

    th_g = db.Column(
        db.Float
    )

    r_g = db.Column(
        db.Float
    )

    a_g = db.Column(
        db.Float
    )

    s_g = db.Column(
        db.Float
    )

    b_g = db.Column(
        db.Float
    )

    fgp = db.Column(
        db.Float
    )

    fga_g = db.Column(
        db.Float
    )

    ftp = db.Column(
        db.Float
    )

    fta_g = db.Column(
        db.Float
    )

    to_g = db.Column(
        db.Float
    )

    pV = db.Column(
        db.Float
    )

    thV = db.Column(
        db.Float
    )

    rV = db.Column(
        db.Float
    )

    aV = db.Column(
        db.Float
    )

    sV = db.Column(
        db.Float
    )

    bV = db.Column(
        db.Float
    )

    fgpV = db.Column(
        db.Float
    )

    ftpV = db.Column(
        db.Float
    )

    toV = db.Column(
        db.Float
    )

    season = db.Column(
        db.Integer,
        nullable=False
    )


def connect_db(app):
    """Connect this database to provided Flask app.

    You should call this in your Flask app.
    """

    app.app_context().push()
    db.app = app
    db.init_app(app)
