# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

{
    "ATLENS": {
        "rimless-1": 20,
        "metal-frame-1": 200,
        "metal-frame-2": 0,
        "acetate-frame-1": 1,
        "acetate-frame-2": 10
    },
    "LETHA": {
        "rimless-1": 20,
        "metal-frame-1": 200,
        "metal-frame-2": 200,
        "acetate-frame-1": 100,
        "acetate-frame-2": 100
    }
}

{
    "id": 2020020008,
    "shipping_country": "ES",
    "lines": [{
        "sku": "metal-frame-2",
        "quantity": 1,
        "prescription": {
            "type": "single_vision",
            "lens_color": null,
            "left": {
                "SPH": -1
            },
            "right": {
                "SPH": -1.25
            }
        }
    }]
}

# Technical assignment

At Ace & Tate we sell glasses. These come in two versions, prescription and
non-prescription glasses. Since prescription glasses are made to order, we route orders to one of our two
production partners: ATLENS and LETHA. We determine which production partner to used based on a
list of production business rules.

Production Business Rules:
- All orders should be routed to ATLENS, unless one of the below rules matches
- Orders with a multifocal prescription must be routed to ATLENS
- Orders with sku rimless-1 must be routed to LETHA
- Orders that are US bound, must be routed to ATLENS
- Orders that have lens color ATGRDRED01 must be routed to ATLENS
- Orders out of stock at ATLENS should be routed to LETHA
- Orders with a high prescription (SPH < -6 and SPH > 4) should be routed to
  LETHA

Your task is to create an endpoint which accepts a JSON payload like the ones in
the payload folder. The response should be the routing result in a json.

The endpoint should be `POST /api/routeOrder`, the response should be a 200 OK
with the folowing payload:
``` json
{
  "routing_result": "ATLENS"
}
```

In the stock folder, you'll find an example of our stock levels, which you can
use in this assignment.

Good luck and have fun! :)
