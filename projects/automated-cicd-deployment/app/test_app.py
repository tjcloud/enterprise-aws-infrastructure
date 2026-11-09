from app.app import app


def test_home_returns_200():
    app.config["TESTING"] = True
    client = app.test_client()

    response = client.get("/")

    assert response.status_code == 200


def test_home_returns_correct_message():
    app.config["TESTING"] = True
    client = app.test_client()

    response = client.get("/")
    data = response.get_json()

    assert data["message"] == "CI/CD demo application is running"
    assert data["version"] == "1.0.0"


def test_health_endpoint():
    app.config["TESTING"] = True
    client = app.test_client()

    response = client.get("/health")
    data = response.get_json()

    assert response.status_code == 200
    assert data["status"] == "healthy"


def test_invalid_url_returns_404():
    app.config["TESTING"] = True
    client = app.test_client()

    response = client.get("/does-not-exist")

    assert response.status_code == 404
