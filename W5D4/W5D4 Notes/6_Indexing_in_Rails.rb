# 
#
# ActiveRecord Indexes and Uniqueness
#
#

# Indexing
- Consider the following query. This query is O(n) time complexity. This is a tablescan and is fairly expensive. 
			SELECT *
			FROM Users
			WHERE Name = 'Mike'
- If our app had ten million users: this query is being called 100 times per second. The database will crash
- Indexing is a way of marking columns that are heavily used for lookups in queries
- When you index a column, it creates a sorted data structure with pointers to the actual table
- Since it is sorted, lookups use binary search, which runs in O(log n) time, which improves performance dramatically
- Indexes are great, but they make writes (INSERT, DELETE, UPDATE) more taxing since the index must also be updated
- Optimizations made outside the bottleneck are useless; you need to index the right things
- Foreign keys are pretty much always a good choice for indexing: they are frequently used in WHERE and JOIN conditions


# Indexing a Foreign Key
- Using a foreign key as an example, take the following code:
				class User < ApplicationRecord
				  has_many :conversations, foreign_key: :user_id
				end

				class Conversation < ApplicationRecord
				  belongs_to :user, foreign_key: :user_id
				end   
- Given a conversation, we can quickly lookup a user because users.id is the primary key, which are indexed by definition
- But if we were matching on conversations, each generated query would require a full table scan
- We can use the add_index method to our migration
- We can also add extra options such as 'unique: true', which checks to see that a column contains only unique values
				
				class AddUserIdIndexToConversations < ActiveRecord::Migration[5.1]
				  def change
				    add_index :conversations, :user_id, unique: true
				  end
				end