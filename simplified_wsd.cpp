/* 
* Simplified Sense Word Disambiguation algorithm written by Ahmed Siddiqui and
* Jordan Kirchner based off of Michael Lesk's simplified algorithm
* (https://en.wikipedia.org/wiki/Lesk_algorithm#Simplified_Lesk_algorithm)
*/

/*

Algorithm: 
function SIMPLIFIED LESK(word,sentence) returns best sense of word
    best-sense <- most frequent sense for word
    max-overlap <- 0
    context <- set of words in sentence
    for each sense in senses of word do
        signature <- set of words in the gloss and examples of sense
        overlap <- COMPUTEOVERLAP (signature,context)
        if overlap > max-overlap then
            max-overlap <- overlap
            best-sense <- sense
end return (best-sense)

*/

#include <iostream>
#include <string>
#include <bits/stdc++.h>
#include <nlohmann/json.hpp>
#include <boost/algorithm/string.hpp>


using json = nlohmann::json;
using namespace std;

int compute_overlap(string sense, vector<string> context)
{
    /*
    In this function, we want to go tokenize the sense. After that, we want to compute the
    */
    vector<string> sense_tokens;
    int overlap = 0;
    get_word_set(sense, sense_tokens);
    for (int i = 0; i < sense_tokens.size(); i++) {
        for (int j = 0; j < context.size()) {
            if (boost::iequals(sense_tokens[i], context[j])) {
                overlap++;
            }
        }
    }
    return overlap;
}

void get_all_senses(string word, vector<string> &all_senses)
{
    /* 
    This function will query dictionary.json and get the definition of the
    word. It will then parse through the definition and get all the senses.
    It will then store all those senes in the given vector: all_senses
    */
    // read a JSON file
    std::ifstream i("dictionary.json");
    json j;
    i >> j;

    vector<string> definitions = j[word];
    for (int i = 0; i < definitions.size(); i++) {
        all_senses.push_back(definitions[i]);
    }
}

void get_word_set(string sentence, vector<string> &tokens)
{
    stringstream check1(sentence);
    string tmp;

    while (getline(check1, tmp, ' ')) {
        tokens.push_back(tmp);
    }
}

string simplified_wsd(string word, string sentence)
{
    string best_sense;
    int max_overlap = 0;
    vector<string> context; // This is the set of words in a sentence excluding the word itself.
    vector<string> all_senses; // This is all the senses of the word.
    get_word_set(sentence, context);
    get_all_senses(word, all_senses);
    for (int i = 0; i < all_senses.size(); i++) {
        int overlap = compute_overlap(all_senses[i], context);
        if (overlap > max_overlap) {
            max_overlap = overlap;
            best_sense = all_senses[i];
        }
    }

    return best_sense;
}

int main()
{
    cout << "Find the best sense of the word 'stock' in the following sentence: These stores sell excess stock or factory overruns":
    cout << "The best sense of the word stock in our example is: " << simplified_wsd("stock", "These stores sell excess stock or factory overruns");
    return 0;
}