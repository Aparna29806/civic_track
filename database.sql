create table Users (
    user_id int primary key auto_increment,
    name varchar(100),
    email varchar(100) unique,
    phone varchar(15),
    role ENUM('citizen', 'authority', 'admin') default 'citizen',
    created_at timestamp default current_timestamp
);
create table Issues (
    issue_id int primary key auto_increment,
    user_id int,
    description text,
    location varchar(255),
    image_url varchar(255),
    severity enum('Low','Medium','High') default 'Low',
    status enum('Pending','In Progress','Resolved') default 'Pending',
    assigned_to varchar(100), -- which authority is responsible
    reported_at timestamp DEFAULT CURRENT_TIMESTAMP,
    deadline timestamp,
    escalation_level int default 0,
    foreign key (user_id) references Users(user_id)
);
CREATE TABLE Upvotes (
    upvote_id INT PRIMARY KEY AUTO_INCREMENT,
    issue_id INT,
    user_id INT,
    upvoted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (issue_id) REFERENCES Issues(issue_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    UNIQUE(issue_id, user_id) -- prevent multiple upvotes from same user
);
create table Feedback (
    feedback_id int primary key,
    issue_id INT,
    user_id INT,
    rating ENUM('ThumbsUp','ThumbsDown'),
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (issue_id) REFERENCES Issues(issue_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
