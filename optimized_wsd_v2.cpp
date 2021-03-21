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

#include <omp.h>
#include <iostream>
#include <string>
#include <set>
#include <vector>
#include <fstream>
#include <nlohmann/json.hpp>
#include <boost/algorithm/string.hpp>
#include "wsd.hpp"

using json = nlohmann::json;
using namespace std;


int compute_overlap(string sense, set<string> context) {
    /*
    In this function, we want to go tokenize the sense. After that, we want to compute the
    */    
    int overlap = 0;
    set<string> sense_tokens = tokenize_string(sense);
    
    std::vector<string> vector_sense(sense_tokens.begin(), sense_tokens.end());
    std::vector<string> vector_context(context.begin(), context.end());
    
    auto const n = vector_sense.size();
    auto const o = vector_context.size();
    
    for(auto i = 0u; i < n; i++){
        for (auto j = 0u; j < o; j++){
            if (boost::iequals(vector_sense[i], vector_context[j]))
                overlap++;
        }
    }
    return overlap;
}

vector<string> get_all_senses(string word) {
    /* 
    This function will query dictionary.json and get the definition of the
    word. It will then parse through the definition and get all the senses.
    It will then store all those senes in the given vector: all_senses
    */
    // read a JSON file
    string dictionary_name = "/Users/ahmedsiddiqui/Workspace/UVic/Winter_2021/CSC485C/wsd-485c/final_dictionary/";
    dictionary_name += word[0];
    if (word[1] != '\0')
        dictionary_name += word[1];
    dictionary_name += ".json";

    std::ifstream i(dictionary_name);
    json j;
    i >> j;

    return j[word];
}

set<string> get_word_set(string word, string sentence) {
    set<string> words = tokenize_string(sentence);
    words.erase(word);
    return words;
}

set<string> tokenize_string(string sentence) {
    stringstream stream(sentence);
    set<string> words;
    string tmp;
    while (getline(stream, tmp, ' ')) {
        words.insert(tmp);
    }
    
    return words;
}


string simplified_wsd(string word, string sentence) {
    string best_sense;
    int max_overlap = 0;

    set<string> context = get_word_set(word, sentence); // This is the set of words in a sentence excluding the word itself.
    vector<string> all_senses = get_all_senses(word); // This is all the senses of the word.

    vector<int> overlaps(all_senses.size());
    
    // TIMING BEGIN
    auto const start = chrono::steady_clock::now();

    #pragma omp parallel for
    for (int i = 0; i < all_senses.size(); i++)
        overlaps[i] = compute_overlap(all_senses[i], context);
    
    for (int i = 0; i < all_senses.size(); i++){
        int overlap = overlaps[i];
        if (overlap > max_overlap) {
            max_overlap = overlap;
            best_sense = all_senses[i];
            
            // cout << "best_sense: " << best_sense << "\n";
        }
    }
    
    auto const end = chrono::steady_clock::now();
    
    cout << "Time to run compute overlap was: " << chrono::duration <double, milli> (end - start).count() << " ms" << endl;
    // TIMING END

    return best_sense;
}

int main(int argc, char ** argv)
{
    /*
     cout << "Find the best sense of the word 'stock' in the following sentence:\n\tI'm expecting to make a lot of money from the stocks I'm investing in using my bank account.\n";
     cout << "The best sense of the word stock in our example is:\n" << simplified_wsd("stock", "I'm expecting to make a lot of money from the stocks I'm investing in using my bank account.") << "\n";
     */
    
    // auto start = chrono::steady_clock::now();

    if( argc >= 2 )
    {
        // omp_set_num_threads() sets the global number of threads used by OpenMP
        // If this is not set, then it defaults to the number of cores on the machine
        // Here, we take the value from the first command line argument (`argv[ 1 ]`),
        // after converting it from ascii to int (the `atoi()` function).
        omp_set_num_threads(atoi(argv[ 1 ]));
    }
    
    simplified_wsd("set", "It was a great day of tennis. Game, set, match");
    
    // auto end = chrono::steady_clock::now();
    // auto diff = end - start;
    
    // cout << "Total time to run was: " << chrono::duration <double, milli> (diff).count() << " ms" << endl;
    
     return 0;
}
