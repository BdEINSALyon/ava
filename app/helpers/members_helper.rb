module MembersHelper
  # @param [Department] department
  def display_department(department)
    department.nil? ? t('not_filled') : department.name
  end
  # @param [StudyYear] sy
  def display_study_year(sy)
    sy.nil? ? t('other') : sy.name
  end
end
