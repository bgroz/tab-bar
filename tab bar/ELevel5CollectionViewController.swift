
//  Created by Buğra on 14.05.2017.
//  Copyright © 2017 Buğra Öz. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ELevel5CollectionViewController: UICollectionViewController, UITextFieldDelegate {
    
    var words: [WordModel] = []
    var currentWord: String?
    var characters: [Character] = []
    var selectedCharacters: [String] = []
    var textFields: [UITextField] = []
    var labelQuestion: UILabel?
    var resultTextField: UITextField?
    var buttonCompare: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatasource()
        
        currentWord = words.first?.answer
        characters = Array(currentWord!.characters)
        
        for (index, current) in characters.enumerated() {
            let textField = UITextField(frame: CGRect(x: 1, y: 1, width: 30, height: 27))
            textField.tag = index
            textField.delegate = self
            textField.backgroundColor = .white
            textField.textAlignment = .center
            textField.text = String(current)
            textField.textColor = .clear
            textField.textAlignment = .center
            textField.isUserInteractionEnabled = false
            textFields.append(textField)
        }
        
        configureViews()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(ELevel5CollectionViewController.didTapNext))
        
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.collectionView?.backgroundColor = .gray
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textFields.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.addSubview(textFields[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard selectedCharacters.count <= Int((currentWord?.characters.count ?? 0) / 2) else { return }
        textFields[indexPath.row].textColor = .black
        selectedCharacters.append(textFields[indexPath.row].text ?? "")
    }
}

extension ELevel5CollectionViewController {
    fileprivate func configureViews() {
        let screenWidth = UIApplication.shared.keyWindow?.bounds.size.width ?? 0
        
        labelQuestion = UILabel(frame: CGRect(x: 30, y: 0, width: screenWidth - 60, height: 45))
        labelQuestion?.textAlignment = .center
        labelQuestion?.textColor = .white
        labelQuestion?.font = .systemFont(ofSize: 14)
        labelQuestion?.center.x = view.center.x
        labelQuestion?.center.y = view.center.y - 150
        labelQuestion?.text = words.first?.question
        labelQuestion?.numberOfLines = 0
        view.addSubview(labelQuestion!)
        
        resultTextField = UITextField(frame: CGRect(x: 30, y: 0, width: screenWidth - 60, height: 45))
        resultTextField?.placeholder = "Guess what is it?"
        resultTextField?.center.x = view.center.x
        resultTextField?.center.y = view.center.y - 100
        resultTextField?.backgroundColor = .white
        view.addSubview(resultTextField!)
        
        buttonCompare = UIButton(frame: CGRect(x: 30, y: 0, width: screenWidth - 60, height: 45))
        buttonCompare?.backgroundColor = .blue
        buttonCompare?.setTitle("Check it", for: .normal)
        buttonCompare?.addTarget(self, action: #selector(ELevel5CollectionViewController.didTapCompareButton), for: .touchUpInside)
        buttonCompare?.center.x = view.center.x
        buttonCompare?.center.y = view.center.y
        view.addSubview(buttonCompare!)
    }
    
    func didTapNext() {
        if let oldIndex = words.index(where: { $0.answer == currentWord }), oldIndex + 1 < words.count {
            let nextWord = words[oldIndex + 1]
            buttonCompare?.isEnabled = true
            buttonCompare?.alpha = 1.0
            resultTextField?.isEnabled = true
            resultTextField?.backgroundColor = .white
            labelQuestion?.text = nextWord.question
            currentWord = nextWord.answer
            characters = Array(currentWord!.characters)
            textFields.removeAll()
            for (index, current) in characters.enumerated() {
                let textField = UITextField(frame: CGRect(x: 1, y: 1, width: 30, height: 27))
                textField.tag = index
                textField.delegate = self
                textField.backgroundColor = .white
                textField.textAlignment = .center
                textField.text = String(current)
                textField.textColor = .clear
                textField.isUserInteractionEnabled = false
                textFields.append(textField)
            }
            textFields.forEach { $0.textColor = .clear }
            collectionView?.reloadData()
        } else {
            navigationItem.rightBarButtonItem = nil
            buttonCompare?.isEnabled = false
            resultTextField?.isEnabled = false
            resultTextField?.backgroundColor = .gray
            buttonCompare?.alpha = 0.5
            labelQuestion?.text = "Finished!"
            characters.removeAll()
            textFields.removeAll()
            collectionView?.reloadData()
        }
        resultTextField?.text?.removeAll()
        selectedCharacters.removeAll()
    }
    
    func didTapCompareButton() {
        let resultText = textFields.reduce("") { (resultText, textField) -> String in
            var result = resultText
            result += textField.text ?? ""
            return result
            }.lowercased()
        
        if resultText == (resultTextField?.text)?.lowercased() {
            let alertController = UIAlertController(title: "Congrats!", message: "Correct answer 👏", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] action in
                self?.resultTextField?.text?.removeAll()
                self?.didTapNext()
            }))
            present(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Unfortunatelly wrong!", message: "Wrong Answer 😟", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] action in
                self?.resultTextField?.text?.removeAll()
            }))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func createDatasource() {
        let wordModel = WordModel.init(question: "It is a city", answer: "İstanbul")
        words.append(wordModel)
        let wordModel2 = WordModel.init(question: "It is a fruit", answer: "Armut")
        words.append(wordModel2)
        let wordModel3 = WordModel.init(question: "It is eaten on summer", answer: "Dondurma")
        words.append(wordModel3)
        let wordModel4 = WordModel.init(question: "it is a communication tool", answer: "Telefon")
        words.append(wordModel4)
        let wordModel5 = WordModel.init(question: "It is an animal", answer: "Aslan")
        words.append(wordModel5)
    }
}
