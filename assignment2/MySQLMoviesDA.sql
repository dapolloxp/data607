drop schema if exists moviereviews;
 
CREATE DATABASE moviereviews;
 
use moviereviews;
drop table if exists movies;
drop table if exists movierating;
drop table if exists users;
drop table if exists users_movierating;
 
 
CREATE TABLE movies (
movieid int NOT NULL auto_increment primary key,
title nchar(50) NOT NULL,
length float,
director nchar(50),
category nchar(50)
);

CREATE TABLE movierating (
movieratingid int not null auto_increment primary key,
review TEXT(500),
rating int NOT NULL CHECK(rating >= 0 AND rating <=5),
movieid int,
CONSTRAINT fk_movie_movierating foreign key (movieid)
REFERENCES movies(movieid)

);
 
CREATE TABLE users_movierating (
movieratingid int NOT NULL REFERENCES movierating(movieratingid),
userid int NOT NULL REFERENCES userid(userid),
CONSTRAINT user_ratings primary key(userid, movieratingid)
);
 
CREATE TABLE users (
userid int not null auto_increment primary key,
username nchar(50) NOT NULL,
firstname nchar(50),
lastname nchar(50)
);

insert into movies(title, length, director, category) 
VALUES
("Mission Impossible: Fallout", 148, "Christopher McQuarrie","action"), #1
("Avengers: Infinity War", 149, "Anthony Russo", "action"), #2
("The Quiet Place", 90, "John Krasinski", "horror"), #3
("DeadPool 2", 119, "David Leitch", "comedy"), #4
("Incredibles 2", 118, "Brad Bird", "animation"), #5
("The Equalizer 2", 121, "Antoine Fuqua", "crime"), #6
("The Meg", 113, "Jon Turteltaub", "sci-fi"), #7
("The Nun", 96, "Corin Hardy", "horror"); #8

select * from movies;

insert into movierating (movieid, rating, review)
VALUES
# movieid, rating, review
(1, 5, "The best thrilling movie ever made! With the best movie character ever portrayed: Tom Cruise as Ethan Hunt!"), 
#1
(1, 4, "While Mission Impossible will certainly require rewatching a couple of times to fully fathom the convolutions of the plot, its nonetheless one very well constructed and directed peice of movie making. The tension never lets up and it kept me intrigued right through to the final action set piece that's so ludicrous I didn't know whether to laugh, cheer or throw something at the screen. The accompanying score goes a long way to making it more acceptable and to be fair this is still my favourite movie in the franchise and I do like them all."),
#2
(1, 4, "The technology may be dated in Mission: Impossible, but the thrills aren't. This is a solid espionage movie with unforgettable sequences and plenty of twists. Yes, the plot is a little overly complicated, but there's a reason this film created an entire franchise: it's highly entertaining to see Ethan Hunt and his team take on a seemingly impossible mission."),
#3
(1, 5, "Mission: Impossible - Fallout once again relies on coherent, well-executed action set pieces, a few moments of winking dialogue and Cruise's complete willingness to hurl himself headlong into harm's way if it might allow him to win our love."),
#4
(1, 1, "Really awful film, couldn't see it til the end. Loved all the others, very disappointed"),
#5
(2, 2, "At stake, as ever, is the fate of the universe. Why must it always be the universe? What's wrong with the fate of Hackensack? Doesn't anyone care what happens to South Dakota, or Denmark, or Peru?"),
#1
(2, 5, "Never has the Marvel Cinematic Universe seemed like more of a universe, in ways both good and bad. Infinity War-the title is almost too apt-is far from a perfect movie, but it is probably close to the best movie it could have been."),
#2
(2, 2, "Avengers: Infinity War isn't just a gussied-up mediocrity being widely mistaken for a good movie. It's also, at least arguably, a dangerous movie for anyone who cares about the future of American cinema."),
#3
(2, 4, "Personally, I think that most people will either like this movie or love it."),
#4
(2, 4, "While the movie has all of the humor and wit that have become Marvel's trademark, this is also the darkest and most devastating onscreen offering they've ever given us."),
#5
(3, 5, "This is a movie about the sound of fear, but it gives us a great deal more to listen to."), 
#1
(3, 4, "A Quiet Place is an undoubtedly taxing affair for the nerves; fortunately, it's also a deeply affecting one."),
#2
(3, 3, "Regardless of some minor quibbles here and there, A Quiet Place is original, atmospheric, tragic, and thrilling."),
#3
(3, 5, "An almost old-fashioned horror that blends psychological battery with hideous, murderous monsters to near-perfection. It's a 90 minute crescendo of suspense, peppered with shocks and heartbreak."),
#4
(3, 4, "An overall delightful film that will become a gem on your shelf, with stellar performances, a unique script, and stunning directorial choices - A Quiet Place will leave you speechles"),
#5
(4, 5, "Deadpool 2 is an R-rated, potty-mouthed splatterfest and a funny one."), 
#1
(4, 3, "For all the impulsive flamboyance of Deadpool's patter, the liberating power of personal virtue, and the disinhibiting promise of second chances, Deadpool 2 feels narrowly impersonal and oppressively unfree."),
#2
(4, 4, "It's a perfect mix of, and tribute to, Rob Liefeld, Fabian Nicieza and Joe Kelly."),
#3
(4, 2, "In this second installment of the Deadpool cinema franchise, I was mightily impressed with the visual and computer effects ..."),
#4
(4, 2, "Boring waste of time."),
#5
(5, 5, "How great to see them back in this funny, exciting, if less audacious film."),
#1
(5, 5, "The Incredibles 2 is an undeniable triumph, but it is also so keenly aware that it becomes exhausting."),
#2
(5, 2, "Incredibles 2 regresses to a time when any power women managed to acquire was carefully controlled so as not constitute a threat to the male order. Such nostalgia is self-defeating."),
#3
(5, 3, "The biggest struggle the sequel finds is that it really doesn't have anything new to say that wasn't present in the first film."),
#4
(5, 4, "The second part to the Incredibles saga has just as much emotion as the first but the action and performances have powered up."),
#5
(6, 3, "Once it's over, you won't necessarily be itching for an Equalizer 3."),
#1
(6, 2, "McCall, for all his high-minded talk, seems to take a little too much sick glee in all the bloodletting he engages in."),
#2
(6, 3, "If you're a fan of Denzel Washington then I think we can all agree that this movie is just padding his stats at this point."),
#3
(6, 2, "Between the moralizing life lessons that are spouted at full volume intensity, the film doesn't shy away from graphic, bloody violence."),
#4
(6, 1, "I'm not sure audiences are getting what they deserve with this plodding, so-so action-thriller, but they'll get what they'll pay for.."),
#5
(7, 3, "The biggest issue is the aforementioned inability to settle on what it wants to be; the dissonance basically results in a movie that is neither good enough nor bad enough to be really fun"), #7
#1
(7, 2, "What little shark attack action we get is far too sporadic and uninspired."), 
#2
(7, 3, "I wanted this movie to be wackier, crazier, and over the top, the problem is that it's PG13."),
#3
(7, 1, "Man, I can't wait to see this one again on a lazy weekend."),
#4
(7, 2, "Totally disappointing. It looked better in the trailer than what it was"),
#5
(8, 1, "Were it not for sudden blasts of Dolby fury, there would be nothing to provide shocks, let alone scares. What terrifies most is the complete and utter lack of plot."),
#1
(8, 2, "It's a pity that the storyline is so weak, given that Bichir and Farmiga both give excellent performances."),
#2
(8, 3, "The story was so, so. It wasn't as scary as I was hoping for"),
#3
(8, 4, "Some great scary moments. The nun is definitely one of the creepest in the anabelle franchise."),
#4
(8, 5, "Meh. I was bored throughout the film. I didn't jump once.");
#5

insert into users(username, firstname, lastname)
VALUES
("RussellS", "Russell", "S"), # 1
("JoelH", "Joel", "H"),  # 2
("BillK", "Bill", "Kral"), # 3
("JosephineL", "Josephine", "Livingstone"), # 4
("DavidA", "David", "A"); #5



insert into users_movierating(userid, movieratingid)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),

(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10),

(1, 11),
(2, 12),
(3, 13),
(4, 14),
(5, 15),

(1, 16),
(2, 17),
(3, 18),
(4, 19),
(5, 20),

(1, 21),
(2, 22),
(3, 23),
(4, 24),
(5, 25),
(1, 26),
(2, 27),
(3, 28),
(4, 29),
(5, 30);






select * from users;
select * from movies;
select * from movierating;
select u.username,m.title, mr.rating, mr.review from users as u
join users_movierating as umr on u.userid = umr.userid
join movierating as mr on umr.movieratingid = mr.movieratingid
join movies as m on mr.movieid = m.movieid;


select u.username, u.firstname, u.lastname, m.title, m.category, m.length, mr.rating, mr.review from users as u
join users_movierating as umr on u.userid = umr.userid
join movierating as mr on umr.movieratingid = mr.movieratingid
join movies as m on mr.movieid = m.movieid;