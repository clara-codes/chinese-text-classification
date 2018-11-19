This is a repo dedicated to demo a simple text classification task, using machine learning i.e. scikit learn, to tag Traditional Chinese articles selected from HK01 (https://www.hk01.com/).

The notebooks mainly contain the following codes: 
### DataPreprocessing
Text cleansing, labels encoding and stratified train-test-valid split
### TextClassification
Model selection (Multinominal Naive Bayes Classifier, K-nearest Neighbors Classifier, Support Vector Classification), GridSearch on selected models and model evaluation of the best models produced by GridSearch
### ModelEvaluation
Model evaluation on the text set (held-out set), evaluation and predicts on the unlabelled test set. 

**Note**

Final model: Multinominal Naive Bayes Classifier for the classification task, and TfidfVectorizer on a character level by n-gram of (2,4) to vectorize the text as inputs for the classifier.

1. The model is mainly scored by mean accuracy, as a base measure for the model performance. As seen in the evaluation on both validation set and test set, the final model has accuracy `>0.9`, indicating that there is no observable over-fitting and it is pretty accuracte as a classifier on this specific article-tagging task. In a real-life case, with an unlabelled dataset, though there is no measure of accuracy due to lack of ground-truth labels, but by eye-balling the predictions with lowest confidence, the model is capable to find suitable tags for ambiguous articles.

2. Given the time constraint, the text classification is done with a simple classification algorithm without over-complicating the solution, such that the tokenization of Chinese text is done alongside learning the parameters of the tfidf vectorizer without training a segmentation algorithm separately. And for both the vectorizer and classifier i.e. multinominal Naive Bayes classifier, the parameters are tuned and selected through grid search. 

3. In most cases of text analytics, the sequence of tokens matters. Yet in this specific case of article-tagging as text classification task, it is deemed that sequence of tokens matters less, and the tokens can be treated as indepdent features for training. This can be understood as humans tagging articles based on observations of keywords' occurences. Since the features can be treated independently, Naive Bayes theorm applies. Hence a multinominal Naive Bayes classifier can be suitable for this article-tagging task, based on the tokens' occurences (inverse-document-frequency reweighted), to decide the probability of one article belonging to one of the tags. 