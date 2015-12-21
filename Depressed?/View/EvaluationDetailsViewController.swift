import UIKit

private enum EvaluationDetailsSection: Int {
    case Explanation
    case Score
    case ScoreMapping
    case Count
}

class EvaluationDetailsViewController: UITableViewController {

    var viewModel: EvaluationViewModel? {
        didSet {
            if let _ = viewModel {
            tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 96
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        switch indexPath.section {
        case EvaluationDetailsSection.Explanation.rawValue:
            cell = tableView.dequeueReusableCellWithIdentifier("explanation", forIndexPath: indexPath)
            if let cell = cell as? ExplanationCell, viewModel = viewModel {
                cell.label.text = viewModel.explanationText
            }

        case EvaluationDetailsSection.Score.rawValue:
            cell = tableView.dequeueReusableCellWithIdentifier("score", forIndexPath: indexPath)
            if let cell = cell as? ScoreCell, viewModel = viewModel {
                cell.scoreLabel.text = viewModel.score
                cell.diagnosisLabel.text = viewModel.diagnosis
            }

        case EvaluationDetailsSection.ScoreMapping.rawValue:
            cell = tableView.dequeueReusableCellWithIdentifier("mapping", forIndexPath: indexPath)
        default:
            break
        }
        
        return cell!
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let _ = viewModel {
            return EvaluationDetailsSection.Count.rawValue
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
