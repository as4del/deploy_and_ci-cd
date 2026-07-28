async def test_ping(service_client):
    response = await service_client.get('jacobsthal-lucas/1')

    assert response.status == 200
    assert response.text == '2'