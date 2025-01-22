# Wally's Wonderful Festival App

## Description
The festival app is an admin utility for viewing details of the various shows, itineraries, and users for their festival. This backend manages the db according to this schema:
<img width="1247" alt="Screenshot 2025-01-21 at 10 08 38 AM" src="https://github.com/user-attachments/assets/1e05759a-0a04-481f-a047-314660b37806" />


## Installation Steps
1. Clone the Repository: [App](https://github.com/wally-yawn/mod_3_final_be).
2. Install Dependencies:
```bundle install```
3. Set up the database: 
```rails db:create```
```rails db:migrate```
```rails db:seed```
4. Start Your rails server: 
```rails server```

## Namespaced API Routes
All API routes are under the /api/v1 namespace:

### Itineraries

GET /api/v1/itineraries
 - Fetches a list of all itineraries.
 - Maps to: api/v1/itineraries#index
GET /api/v1/itineraries/:id
 - Fetches the details of a specific itinerary by its ID.
 - Maps to: api/v1/itineraries#show

### User Itineraries

GET /api/v1/user_itineraries/:id
 - Fetches user-specific itinerary details.
 - Maps to: api/v1/user_itineraries#show

### Shows

DELETE /api/v1/shows/:id
 - Deletes a show by its ID.
 - Maps to: api/v1/shows#destroy
