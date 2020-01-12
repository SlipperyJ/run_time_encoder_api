# Run Length Encoder API

My solution to creating a run length encoder API.

I initially started the project using Rails as the framework but quickly decided against it. As I only needed something lightweight, I decided to go with Sinatra.

App has full rubocop coverage.

## Usage

### Encoding endpoint:

#### URL
>/encode

#### Method
>POST

#### Data Params
>'OOOOFFFFFFKBGGGEEEEEEE'

#### Success Response
> **Code:** 200
<br>

> **Content:** '4O6FKB3G7E'

#### Error Response
> **Code:** 422 Unprocessable Entry
<br>

> **Content:** 'Text to encode is invalid'

---

### Decoding endpoint:

#### URL
> /decode

#### Method
> POST

#### Data Params
> '6F3RF'

#### Success Response:
> **Code:** 200
<br>

> **Content:** 'FFFFFFRRRF'

#### Error Response
> Code: 422 Unprocessable Entry
<br>

> Content: 'Text to encode is invalid'
