
# News Feeds

A Flutter App that is integrated with news and headlines api to list out the realtime and updated feeds.

## Technology Used

| Tech             | Version                                                                |
| ----------------- | ------------------------------------------------------------------ |
| Flutter | >=3.1.5 <4.0.0 |
| Getx | 4.6.6 |
| Shared Preferences | any  |
| Http |  1.1.0 |
| connectivity_plus | 5.0.1 |
| Url Launcher |  6.2.1 |



## API Reference

#### Get all news

```http
  GET https://newsapi.org/v2/everything?q=bitcoin&apiKey=3b620421ce5a407681180f82f74c2817
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `apiKey` | `string` | **Required**. Your API key |

#### Get all headlines

```http
  GET https://newsapi.org/v2/top-headlines?country=us&apiKey=3b620421ce5a407681180f82f74c2817
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `apiKey` | `string` | **Required**. Your API key |


## Project workflow
####
  - when user opens the app, internet connectivity will be checked using ` connectivity_plus` package.
   - if connection == True, user will redirected to homePage, else retry option is given
   - On HomePage, multiple controllers will get initialized at the same time for seamless app experience.
   - controllers will call news and headlines api and store it in controller lists which are used in different screen.
   - HomePage have all news
   - Headline Page have all headlines
   - bookmark page have news & headline based bookmarks in different sections for better user experience.
   - User can add news or headline to bookmark from respective more info page
   - From the more info page, user can also save source of that feed and can see it from the drawer in app
   - All the data is saved in local Storage using Shared Preferences.
   - In NewsPage , there is a search button in appbar which can be used to search news.


### Developer
 - [Honey Bansal](https://www.linkedin.com/in/honey-bansal-430a46194/)