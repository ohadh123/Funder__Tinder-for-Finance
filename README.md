# Funder: Tinder for Finance
Fall in love with Investing! 
Easy-to-use, risk-free investing app motivating high schoolers to learn more about finance by competing with friends

# Cornell's BigRedHacks: Prized as Finalist Project, and Sole Winner of BNY Mellon FinTech Award!

# Inspiration
All the members of our group have an interest in finance, but we were never introduced to the subject until we came to college. According to the National Financial Educators Council, 83% of high school students believe that finance should be mandatory in schools. The average score of high schoolers on financial literacy test is a failing 58%. To help spread awareness and interest in finance among high schoolers, we decided to build an intuitive investing app that introduces students to an easier and fun version of the world of finance.

# What it does
Our app uses a similar, easy-to-use interface as the famous Tinder app that lets users swipe on companies to either not invest, invest $5,000, or invest $25,000 of simulated money. Using financial data from the internet, these stocks may go up or down in price, increasing the user’s total capital. The cards that the users swipe on display the company logo and summary. If the user clicks on the card, a one month chart of past stock prices is displayed as well as other useful statistics. A user can view and sell his or her stocks by viewing their portfolio page. Additionally, the user creates a public profile and can join multiple leagues. These leagues can be a classroom league, or it can just be with a group of friends. When a user selects a league, they can see their ranking among everyone else in the group. Additionally, the user can view other players’ profiles by clicking on their ranking to look into their general portfolios as well as specific investments. By adding this social competition aspect, users are more inclined to learn about their companies and get engaged in the app.

# How we built it
Funder was developed directly from scratch and built on the XCode platform using Swift, UI Frameworks, and cocopods. Once we decided on our idea and designs, we dived straight into the code. Our single-view app manages a collection of UIApplicationView subclasses and enables their interaction through a MenuView framework. We designed the card stack, with the swiping and detail features, to mimic Tinder's functionalities; we even added a "super invest" button as an added utility! From there, we created a Portfolio TableView that contains all current company holdings with a sell functionality, and we added a Leaderboards TableView to match your rank against friends and to check out other people's investments. Our code is designed in a very clean and readable fashion in that it is easily replicable and scaleable for future use.

# Challenges we ran into
Despite our rapid progress and achievement, we ran into a few challenges that proved quite tough to overcome. From a design perspective, we spent a lot of time creating a logo and choosing a gradient pastel pattern that would best represent our app's theme and purpose. From a technical standpoint, we had some trouble implementing our MenuView framework, transferring and updating attributes rapidly among classes, and altering swift's built-in TableView functions, but we were ultimately able to prevail through mentor advice and research on the web.

# Accomplishments that we're proud of
 - Built a fully-functional iOS app from scratch that integrates education, finance, and entertainment all in one

 - Developed a business model that is sustainable as well as beneficial to the community (both companies and consumers)

 - Huge potential developments in areas such as machine learning (analyzing data produced by the app, i.e demographics of users versus companies interested in), competitions (league ops), and micro transactions (additional swipes, large investments, etc).

 - Scalability: with the additional of just a single API, can produce thousands of additional live, accurate company cards via scraping, and app can be pushed to the app-store and distributed nationwide.

 - Functionality: includes dozens of additional utilities including leaderboards, editable self-portfolios, settings, super investments, viewing other users' profiles, etc.

 - Attention to detail: from designing our own logo to updating a list count to display proper positions despite user actions, no shortcuts were taken, and that's apparent in our final project!

 - Project execution: despite only one team member being familiar with Swift, we managed to create a workable application after 19 straight hours of coding on Saturday.

 - For students, by students: raising awareness and interest in finance through an accessible medium to fellow students

# What we learned
Since only one of our members had extensive experience with Swift, we learned a lot about iOS development and XCode as a whole. This was also the first hackathon for all of us, so we learned how to think and how to work together as a team. Some of the most important lessons that we took was how to structure a project as large as this; we learned how to split up the project according to our individual strengths, how to design and implement an app from start to finish, how to brainstorm and ideate, and how to deal with a very limited timeframe to create a functional project.

# What's next for Funder - Fall in Love with Investing!.
First of all, we want to create a minimum viable product with full functionality that allows for data scraping of stock prices and statistics and the creation of personal profiles. In the short run, we want to be able to integrate APIs such as FINRA into our app so that it’s easier to scrape data into our application. We’re also hoping to fully implement our league aspect of the app so that users can invite each other to Funder Leagues where they can directly compete against each other in their investments. This would be an easy way to get entire classrooms involved in investments and would accentuate the competition aspect of Funder.

As a long-term goal, we want to create a revenue stream for our product. We want to provide users with the ability to buy large investments or small investments through in-app purchases. These purchases would allow users to increase their capital and portfolio diversity, but they would still be ranked based on percent increase. We also want to implement a sponsored companies/page ranking option where companies can pay for their cards to show up more often on users’ screens. Finally, with the completion of personal profiles, we can collect data on our users and then sell that data back to companies on Funder so that they can better know the demographics of people interested in investing in their companies.

Additionally, we will begin to focus on marketing to address our market. We will try to form partnerships with high school economics, finance, or business teachers and companies like Pearson to increase our market reach. Furthermore, we want to market these ideas locally to Ithaca and in our hometowns. We will also use Facebook and Instagram advertisements to target high schoolers interested in money or finance.
