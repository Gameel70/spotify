# Spotify

Spotify is a simple ruby-based application that applies a set of changes to a given json file.

### Prerequisites

This project expects the following tool installed on your devise.
- Ruby [2.7](https://www.ruby-lang.org/en/news/2019/12/25/ruby-2-7-0-released/)

##### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.7.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.5.1
```

### Assumptions

- This is a comparatively small project so we assume:
-- spotify.json(input file) will not be empty
-- changes.json(changes file) will not be empty
-- changes.json(changes file) will be in JSON format

#### Project Setup

- Unzip the project folder and move to the project directory.
- run the application through the following command:
    ```sh
    ruby spotify.rb spotify.json changes.json output.json
    ```
- where spotify.json is the name of the input file, changes.json is the file that has the required changes and output.json is the file in which the final result will be stored once the changes have been applied.

### Scaling the App

- To handle large input/change files, we can read data change by change, i.e read data for updating playlists, apply changes to the input file and then move onto the next change i.e creating new playlists.
- We do not need song data or users data much for handling these changes as all of them belong to playlists. What we can do is that we can store ids for songs and users that exists in our input file and use those arrays later when needed to check if a user/song exists in the input file.

### Design Decisions

- I implemented the logic for each type of change separately so that they could be tested or applied independently if required.

### Time Spent

- I spent 1.5 hours doing this project, which includes thinking, development, and testing.
# Spotify

Spotify is a simple ruby-based application that applies a set of changes to a given json file. The input file will contain data for users, songs, and playlists. We can apply a set of changes to it which include:
* Adding an existing song to an existing playlist
* Creating a new playlist for an existing user, with atleast one existing song.
* Removing a playlist

Once these changes have been applied, the resulting data is stored in an output file in JSON format.

### Prerequisites

This project expects the following tool installed on your devise.
- Ruby [2.7](https://www.ruby-lang.org/en/news/2019/12/25/ruby-2-7-0-released/)

##### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.7.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.7.2
```

### Assumptions

This is a comparatively small project so we assume:
- spotify.json(input file) will not be empty
- changes.json(changes file) will not be empty
- changes.json(changes file) will be in JSON format

#### Project Setup

- Unzip the project folder and move to the project directory.
- run the application through the following command:
    ```sh
    ruby spotify.rb spotify.json changes.json output.json
    ```
- where spotify.json is the name of the input file, changes.json is the file that has the required changes and output.json is the file in which the final result will be stored once the changes have been applied.

### Scaling the App

- To handle large input/change files, we can read data change by change, i.e read data for updating playlists, apply changes to the input file and then move onto the next change i.e creating new playlists.
- We do not need song data or users data much for handling these changes as all of them belong to playlists. What we can do is that we can store ids for songs and users that exists in our input file and use those arrays later when needed to check if a user/song exists in the input file.
- We can use cache to store input which will help speeding up the entire process.

### Design Decisions

- I implemented the logic for each type of change separately so that they could be tested or applied independently if required.

### Time Spent

- I spent 1.5 hours doing this project, which includes thinking, development, and testing.
