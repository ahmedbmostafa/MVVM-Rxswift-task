//
//  FilterVC.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import UIKit

protocol getTagger: class {
    func getData(min:Int, tagger:String)
}

class FilterVC: UIViewController {
    @IBOutlet weak var minTxtF: UITextField!
    @IBOutlet weak var taggedTxtF: UITextField!
    @IBOutlet weak var minView: UIView!
    @IBOutlet weak var taggedView: UIView!

    var viewModel: FillterViewModel! = FillterViewModel()
    var min = 0
    var tagger = ""
    weak var delegate: getTagger!

    override func viewDidLoad() {
        super.viewDidLoad()
        setTxtFDelegates()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func applyBtnTapped(_ sender: Any) {
        guard let min = minTxtF.text else {return}
        guard let tagger = taggedTxtF.text else {return}
        if min != "" && tagger != "" {
            guard let minIntValue = Int(min) else {
                view.makeToast("Wrong Value")
                return
            }
            delegate!.getData(min: minIntValue, tagger: tagger)
            viewModel.toMainVC(self, min: minIntValue, tagger: tagger)
        } else {
            view.makeToast("Fill Text Input")
        }
    }
    func setTxtFDelegates(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        minTxtF.addTarget(self, action: #selector(minAction), for: .touchDown)
        taggedTxtF.addTarget(self, action: #selector(taggedAction), for: .touchDown)
    }
    @objc func dismissKeyboard() {
        minView.backgroundColor = .systemGray4
        taggedView.backgroundColor = .systemGray4
        view.endEditing(true)
    }
    @objc func minAction() {
        minView.backgroundColor = .systemYellow
        taggedView.backgroundColor = .systemGray4
    }
    @objc func taggedAction() {
        minView.backgroundColor = .systemGray4
        taggedView.backgroundColor = .systemYellow
    }
    @IBAction func backBtntapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
